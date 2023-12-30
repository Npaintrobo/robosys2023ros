from setuptools import find_packages, setup

package_name = 'robosys2023ros'

setup(
    name=package_name,
    version='0.0.0',
    packages=find_packages(exclude=['test']),
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='nonaka',
    maintainer_email='nonakashinnosuke@gmail.com',
    description='parroting',
    license='BSD-3-Clause',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'parrot = robosys2023ros.parrot:main',
            'human = robosys2023ros.human:main'
        ],
    },
)
