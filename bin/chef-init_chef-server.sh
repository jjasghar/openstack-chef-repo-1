#!/bin/bash -x
knife client delete opstall -y
knife node delete opstall -y
rm ~/.ssh/known_hosts
