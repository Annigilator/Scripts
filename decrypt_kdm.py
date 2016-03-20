#!/usr/bin/env python

import os
import struct
import sys


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
        output_path = self.get_output_path(filepath)
        if not self.replace_files and os.path.isfile(output_path):
            to_stdout('Skip {} ({} exists)\n', filepath, output_path)
            return

        to_stdout('Decrypting {}... ', filepath)

        try:
            with open(output_path, 'w') as output:
                output.writelines(self.decrypted_lines(filepath))
        except Exception, e:
            to_stdout('FAILED\n')
            to_stderr('ERROR: {}\n', str(e))
            return

        to_stdout('OK (=> {})\n', output_path)


def main():
    filepaths = frozenset(sys.argv[1:])

    if not filepaths:
        raise SystemExit('Nothing to decrypt')

    # Set input arguments to change decrypter behaviour; for example:
    # decrypter = Decrypter(
    #     numbers_delimiter=' ',
    #     output_extension='dcr',
    #     replace_files=True
    # )
    decryptor = Decryptor()

    for filepath in filepaths:
        if not os.path.isfile(filepath):
            to_stderr('WARNING: file {!r} wasn\'t found\n', filepath)
            continue

        decryptor.decrypt(filepath)


if __name__ == '__main__':
    main()
