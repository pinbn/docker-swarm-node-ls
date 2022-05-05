# Security Notice
This container runs the docker CLI, with the docker socket mounted in a read-write fashion. Please only run this on an internal-only, secured network. While there should be no way to pass any arguments to it, the principle of least access should apply to this container given the access it must have to return the data requested.

# Usage
You can embed this into a dashboard, like a Grafana one, with a simple Javascript to reload it every minute.
