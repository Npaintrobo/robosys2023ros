#!/usr/bin/python3
# SPDX-FileCopyrightText: 2023 Shinnosuke Nonaka 
# SPDX-License-Identifier: BSD-3-Clause

import rclpy
from rclpy.node import Node
from std_msgs.msg import String

import random

class Parrot(Node):
    def __init__(self):
        super().__init__("parrot")
        self.subscription = self.create_subscription(String, '/human_topic', self.callback, 10)

    def generate_random_parrot_voice(self):
        pv = ['ki--', 'ki-ki-', 'kuwa--', 'kuwa-wa-wa-', None]
        per = [0.04, 0.04, 0.04, 0.04, 0.84]
        result = random.choices(pv, per)[0]
        return str(result)
        
    def callback(self, msg):
        voice = self.generate_random_parrot_voice()
        self.get_logger().info("Received: {}".format(msg.data))
        if voice != 'None':
            self.get_logger().info("Received: {}".format(voice))

def main():
    rclpy.init()
    parrot_node = Parrot()
    rclpy.spin(parrot_node)

if __name__ == '__main__':
    main()
