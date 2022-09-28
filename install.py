import os
from loguru import logger
import yaml


class Env:
    def __init__(self, config_path):
        self.config_path = config_path
        with open(self.config_path, 'r', encoding='utf-8') as f:
            self.config = yaml.safe_load(f)
        logger.add(self.config['log']['output'],
                   rotation=self.config['log']['rotation'],
                   retention=self.config['log']['retention'],
                   level=self.config['log']['level'].upper())
        with open("/etc/issue", "r") as f:
            issue = f.readline()
            if issue.startswith("Arch") or issue.startswith("Manjaro"):
                self.issue_file = "scripts/env-archlinux.sh"
            elif issue.startswith("Ubuntu 22.04"):
                self.issue_file = "scripts/env-ubuntu22.04.sh"
            elif issue.startswith("Ubuntu 20.04"):
                self.issue_file = "scripts/env-ubuntu20.04.sh"
            elif issue.startswith("Ubuntu 18.04"):
                self.issue_file = "scripts/env-ubuntu18.04.sh"
            else:
                self.issue_file = "scripts/env-others.sh"
        self.install_file = 'scripts/install.sh'
        logger.debug("{} Issue file: {}".format(self.config['label'], self.issue_file))
        logger.debug("{} Install file: {}".format(self.config['label'], self.install_file))
        logger.debug("{} Config: {}".format(self.config['label'], self.config))

    def install_dependency(self):
        with open(self.issue_file, "r") as f:
            for line in f.readlines():
                command = line.strip()
                if command.startswith("#") or command.startswith("\n"):
                    continue
                self.exec_command(command)
        logger.success("{} System dependency installed successfully".format(self.config['label']))

    def install_env(self, files):
        with open(self.install_file, "r") as f:
            for line in f.readlines():
                command = line.strip()
                if command.startswith("#") or command.startswith("\n"):
                    continue
                command = command.replace('${rcssserver}', files['rcssserver'], )
                command = command.replace('${rcssmonitor}', files['rcssmonitor'])
                command = command.replace('${librcsc}', files['librcsc'])
                command = command.replace('${soccerwindow}', files['soccerwindow'])
                command = command.replace('${fedit}', files['fedit'])
                self.exec_command(command)
        logger.success("{} Robocup2d environment installed successfully".format(self.config['label']))

    def exit_function(self):
        exit(0)

    def exec_command(self, command):
        if os.system(command) != 0:
            logger.error("{} Error running command: {}".format(self.config['label'], command))
            self.exit_function()
        else:
            logger.success("{} {}".format(self.config['label'], command))

    def get_tar_files(self, dir):
        items = sorted(os.listdir(dir))
        files = dict()
        for i in items:
            if i.endswith('.tar.gz'):
                i = i.split('.tar.gz')[0]
                if i.__contains__('rcssserver'):
                    files['rcssserver'] = os.path.join(dir, i)
                elif i.__contains__('rcssmonitor'):
                    files['rcssmonitor'] = os.path.join(dir, i)
                elif i.__contains__('librcsc'):
                    files['librcsc'] = os.path.join(dir, i)
                elif i.__contains__('soccerwindow'):
                    files['soccerwindow'] = os.path.join(dir, i)
                elif i.__contains__('fedit'):
                    files['fedit'] = os.path.join(dir, i)
                else:
                    pass
        return files

    def execute(self):
        files = self.get_tar_files('assets')
        # print(files)
        self.install_dependency()
        self.install_env(files)
        self.exit_function()  # exit


if __name__ == '__main__':
    Env('config.yaml').execute()
