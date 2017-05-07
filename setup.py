from setuptools import setup


def readme():
    with open('README') as f:
        return f.read()

setup(name='sash',
      version='0.1',
      description='Search multiple shell histories',
      url='https://github.com/wakaru44/sash',
      author='Wakaru44',
      author_email='wakaru44@gmail.com',
      license='MIT',
      scripts = ["bin/sas"],
      packages=['super_advanced_shell_search'],
      zip_safe=False)
