import argparse
import pip
from subprocess import call


def parse_args():
    parser = argparse.ArgumentParser()

    parser.add_argument('-v', '--version', type=str, default='2',
                        help='Version pip')
    return parser.parse_args()


def upgrade(version):
    name_pip = 'pip{0}'.format(version)
    for dist in pip.get_installed_distributions():
        call(name_pip + ' install --upgrade ' + dist.project_name, shell=True)


if __name__ == '__main__':
    options = parse_args()
    upgrade(options.version)
