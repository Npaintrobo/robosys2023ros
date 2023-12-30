#!/usr/bin/python3
# SPDX-FileCopyrightText: 2023 Shinnosuke Nonaka 
# SPDX-License-Identifier: BSD-3-Clause

import rclpy
from rclpy.node import Node
from std_msgs.msg import String

class Player2Node(Node):
    def __init__(self):
        super().__init__('player2')
        self.publisher_ = self.create_publisher(String, 'player2', 10)
        self.subscription_ = self.create_subscription(String, '/parrot_topic', self.callback, 10)
        self.get_logger().info('You are player2. Enjoy chatting!!')

    def callback(self, msg):
        sub_str = msg.data
        self.get_logger().info(f'player1: {sub_str}')

    def run(self):
        while rclpy.ok():
            pub_str = input('Your message: ')
            msg = String()
            msg.data = pub_str
            self.publisher_.publish(msg)

def main(args=None):
    rclpy.init(args=args)
    player2_node = Player2Node()
    player2_node.run()
    rclpy.shutdown()

if __name__ == '__main__':
    main()

