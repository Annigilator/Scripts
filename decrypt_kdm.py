#!/usr/bin/env python

import multiprocessing
import os
import struct
import sys


PARALLEL_PROCESSES_LIMIT = 10


def to_stderr(pattern, *args, **kws):
    message = pattern.format(*args, **kws)
    sys.stderr.write(message)
    sys.stderr.flush()


def to_stdout(pattern, *args, **kws):
    message = pattern.format(*args, **kws)
    sys.stdout.write(message)
    sys.stdout.flush()


class Decryptor(object):
    def __init__(self,
                 output_extension='txt',
                 numbers_delimiter='\t',
                 replace_files=False):

        self.output_extension = output_extension
        self.numbers_delimiter = numbers_delimiter
        self.replace_files = replace_files

    def decrypted_lines(self, path):
        source = open(path, 'rb')

        while True:
            content = source.read(4)
            if content:
                structure = struct.unpack('hh', content)
                yield '{structure[0]}{delimiter}{structure[1]}\n'.format(
                    structure=structure,
                    delimiter=self.numbers_delimiter
                )
            else:
                source.close()
                break

    def get_output_path(self, filepath):
        directory, filename = os.path.split(filepath)
        dot_pos = filename.rfind('.')
        output_extension = self.output_extension

        if dot_pos == -1:
            prefix = filename
        else:
            prefix = filename[:dot_pos]
            if filename[dot_pos + 1:] == output_extension:
                output_extension = 'decrypted'

        new_name = '{}.{}'.format(prefix, output_extension)

        return os.path.join(directory, new_name)

    def decrypt(self, filepath):
        if not os.path.isfile(filepath):
            to_stderr('WARNING: file {!r} wasn\'t found\n', filepath)
            return

        output_path = self.get_output_path(filepath)
        if not self.replace_files and os.path.isfile(output_path):
            to_stdout('Skip {} ({} exists)\n', filepath, output_path)
            return

        to_stdout('Decrypting {}...\n', filepath)

        try:
            with open(output_path, 'w') as output:
                output.writelines(self.decrypted_lines(filepath))
        except (Exception, KeyboardInterrupt), e:
            if os.path.isfile(output_path):
                os.remove(output_path)

            if isinstance(e, KeyboardInterrupt):
                to_stderr('\r{} KeyboardInterrupt\n', filepath)
            else:
                to_stderr('{} ERROR: {}\n', filepath, str(e))

            return

        to_stdout('{} finished (=> {})\n', filepath, output_path)


if __name__ == '__main__':
    filepaths = frozenset(sys.argv[1:])

    if not filepaths:
        raise SystemExit('Nothing to decrypt')

    # Set input arguments to change decryptor behaviour; for example:
    # decryptor = Decryptor(
    #     numbers_delimiter=' ',
    #     output_extension='dcr',
    #     replace_files=True
    # )
    decryptor = Decryptor()

    def process(filepath):
        decryptor.decrypt(filepath)

    processes = min(PARALLEL_PROCESSES_LIMIT, len(filepaths))
    try:
        multiprocessing.Pool(processes).map(process, filepaths)
    except KeyboardInterrupt:
        pass
    except Exception, e:
        to_stderr('ERROR: {}', str(e))
