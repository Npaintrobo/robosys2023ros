import launch
import launch.actions
import launch.substitutions
import launch_ros.actions

def generate_launch_description():
    talker = launch_ros.actions.Node(
            package='robosys2023ros',
            executable='human'
            output='screen'
            )
    listener = launch_ros.actions.Node(
            package='robosys2023ros',
            executable='parrot',
            output='screen',
            )

    return launch.LaunchDescription([human, parrot])
