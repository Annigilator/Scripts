#!/usr/bin/env python

import os
import struct
import sys


def lines_generator(filename, delimiter='\t'):
    source = open(filename, 'rb')

    while True:
        content = source.read(4)
        if content:
            structure = struct.unpack('hh', content)
            yield '{structure[0]}{delimiter}{structure[1]}'.format(
                structure=structure,
                delimiter=delimiter
            )
        else:
            source.close()
            break


def get_output_filename(input_filename, file_extension='txt'):
    dot_pos = input_filename.rfind('.')
    prefix = input_filename[:dot_pos] if dot_pos > 0 else input_filename

    return '{}.{}'.format(prefix, file_extension)


def main():
    input_filenames = frozenset(sys.argv[1:])

    if any(not os.path.isfile(_) for _ in input_filenames):
        raise RuntimeError('Some input files don\'t exist')

    for filename in input_filenames:
        output_filename = get_output_filename(filename)
        lines = lines_generator(filename)

        print '=' * 40
        print 'Decrypting {}...'.format(filename)
        with open(output_filename, 'w') as output:
            output.write('\n'.join(lines))

        print 'Result: {}'.format(output_filename)

    print '=' * 40
    print 'All files decrypted'


if __name__ == '__main__':
    main()
