import pip
from subprocess import call


def upgrade():
    for dist in pip.get_installed_distributions():
        call('pip install --upgrade ' + dist.project_name, shell=True)


if __name__ == '__main__':
    upgrade()
