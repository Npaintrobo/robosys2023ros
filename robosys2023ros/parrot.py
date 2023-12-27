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
        self.publisher = self.create_publisher(String, '/parrot_topic', 10)
        self.timer = self.create_timer(1, self.publish_random_voice)

    def generate_random_parrot_voice(self):
        pv = ['ki--', 'ki-ki-', 'kuwa--', 'kuwa-wa-wa-', None]
        per = [0.05, 0.05, 0.05, 0.05, 0.8]
        result = random.choices(pv, per)[0]
        return str(result)

    def publish_random_voice(self):
        voice = self.generate_random_parrot_voice()
        msg = String()
        msg.data = voice
        self.publisher.publish(msg)
        self.get_logger().info("Published: {}".format(msg.data))

def main():
    rclpy.init()
    parrot_node = Parrot()
    rclpy.spin(parrot_node)
    rclpy.shutdown()

if __name__ == '__main__':
    main()

