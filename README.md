# FOSSShrugBot

FOSS reimplementation of `@ShrugBot` on Telegram.
I made it because that bot is down half the time.

## Build

Install `luarocks` and `libYAML`, then run `setup.sh`.

To run the bot modify the config file or expose the bot token via environmental
variables:

```bash
$ cp config/config.yaml.sample config/config.yaml
# Edit the file
$ nvim config/config.yaml
# OR, use the environmental variable
$ export BOT_TOKEN=bot_token_here
```

Then just run `./start.sh`.

## Docker version

Build the image:

```bash
docker build . -t shrugbot
```

You can then use the following compose file:

```docker-compose
version: "3.5"

services:
    shrugbot:
        image: shrugbot
        environemnt:
            - BOT_TOKEN=bot_token_here
        restart: unless-stopped
```

If you prefer the config file you can mount that in `/app/config`:

```docker-compose
version: "3.5"

services:
    shrugbot:
        image: shrugbot
        volumes:
            - /path/to/your_config_file.yaml:/app/config/config.yaml
        restart: unless-stopped
```
