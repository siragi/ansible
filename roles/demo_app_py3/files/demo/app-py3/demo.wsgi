activate_this = '/var/www/demo/.venv/bin/activate_this.py'
with open(activate_this) as file_:
    exec(file_.read(), dict(__file__=activate_this))
# https://github.com/pallets/flask/issues/1948

import os
os.environ['DATABASE_URI'] = 'mysql://demo:demo@db01/demo'

import sys
sys.path.insert(0, '/var/www/demo')

from demo import app as application
