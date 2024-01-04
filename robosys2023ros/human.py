#!/usr/bin/python3
# SPDX-FileCopyrightText: 2023 Shinnosuke Nonaka 
# SPDX-License-Identifier: BSD-3-Clause

import rclpy
from rclpy.node import Node
from std_msgs.msg import String

class Human(Node):
    def __init__(self):
        super().__init__('human')
        self.publisher = self.create_publisher(String, '/human_topic', 10)

    def publish_text(self, input_text):
        msg = String()
        msg.data = input_text
        self.publisher.publish(msg)
        self.get_logger().info(f'Published: {input_text}')

def main():
    rclpy.init()
    node = Human()

    try:
        while rclpy.ok():
            try:
                user_input = input("human: ")
                if not user_input:
                    continue 
            except EOFError:
                break  

            node.publish_text(user_input)

    except KeyboardInterrupt:
        pass

    finally:
        node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()

