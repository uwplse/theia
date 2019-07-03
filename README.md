# theia
Automatically Visualizing Program Execution

To setup:

First download and install `k`: http://www.kframework.org/index.php/K_tool_binaries.

In `theia-viz`
1. Run `npm install`. This installs the dependencies.
2. Run `chmod +x python-server.py`. This allows bash to execute the python server code.
3. Run `chmod +x log-state.sh`. This allows bash to execute the code that logs the state from `k`.

To run:

In `theia-viz`
1. Run `npm start`. This incrementally compiles the Reason files.
2. In a second window run `node_modules/.bin/webpack-dev-server`. This starts the dev server (necessary to sidestep CORS).
3. In a third window run `./python-server.py`. This starts a local server for the local file system. By default this runs on `localhost:8080`.
4. In a browser, open whatever link was mentioned by the output of step 2. This is probably `localhost:8000`.
