AptInstalls:
  pkg.installed:
    - pkgs:
      - vim
      - nodejs
      - nodejs-legacy
      - npm
      - coffeescript
      - linux-headers-generic
nodeAppsDir:
  file.directory:
    - user:  vagrant
    - name:  /web/{{pillar['appDirRoot']}}/
    - group:  vagrant
    - mode:  755
    - makedirs: True
npm:
  npm.installed:
    - pkgs:
      - express
      - express-generator
      - browserify
      - watchify
    - require:
      - pkg : AptInstalls
express {{pillar['appName']}}:
  cmd.run:
    - cwd: /web/nodeApps
    - creates: /web/{{pillar['appDirRoot']}}/{{pillar['appName']}}
appLogsDir:
  file.directory:
    - user:  vagrant
    - name:  /web/{{pillar['appDirRoot']}}/{{pillar['appName']}}/logs
    - group:  vagrant
    - mode:  755
    - makedirs: True
npm install:
  cmd.run:
    - cwd: /web/{{pillar['appDirRoot']}}/{{pillar['appName']}}

#services to keep running
/etc/init/{{pillar['appName']}}.conf:
  file.managed:
    - contents_pillar: nodeServerConfigUpstartLong
start {{pillar['appName']}}:
  cmd.run
