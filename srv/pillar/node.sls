#!jinja|yaml

{% import_yaml 'configVars.yaml' as configVars %}
nodeServerConfigUpstartLong: |
    #!upstart
    description "node.js server"
    author      "J-Fricke"

    start on startup
    stop on shutdown

    script
        export HOME="/root"

        echo $$ > /var/run/{{configVars.App.Name}}NodeServer.pid
        NODE_BIN=$(which nodejs || which node)
        exec sudo -u vagrant $NODE_BIN /web/{{configVars.App.nodeAppsDir}}/{{configVars.App.Name}}/bin/www >> /var/log/{{ configVars.App.Name }}NodeServer.sys.log 2>&1
    end script

    pre-start script
        # Date format same as (new Date()).toISOString() for consistency
        echo "[`date -u +%Y-%m-%dT%T.%3NZ`] (sys) Starting" >> /web/{{configVars.App.nodeAppsDir}}/{{configVars.App.Name}}/logs/{{ configVars.App.Name }}NodeServer.sys.log
    end script

    pre-stop script
        rm /var/run/{{configVars.App.Name}}NodeServer.pid
        echo "[`date -u +%Y-%m-%dT%T.%3NZ`] (sys) Stopping" >> /web/{{configVars.App.nodeAppsDir}}/{{configVars.App.Name}}/logs/{{ configVars.App.Name }}NodeServer.sys.log
    end script
    respawn

appName:
  {{configVars.App.Name}}
appDirRoot:
  {{configVars.App.nodeAppsDir}}