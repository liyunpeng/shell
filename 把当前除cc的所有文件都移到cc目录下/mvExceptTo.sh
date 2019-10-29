#! /bin/bash
ls | grep -vw cc | xargs -i mv {} cc/
