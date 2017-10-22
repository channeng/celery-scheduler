from app import app
from flask_script import Manager, Server


manager = Manager(app)
manager.add_command("runserver", Server(host="0.0.0.0", port=8889))


@manager.command
def test():
    from app.tasks.test import print_hello

    print_hello()


if __name__ == '__main__':
    manager.run()
