[![Tweet this](http://img.shields.io/badge/%20-Tweet-00aced.svg)](https://twitter.com/intent/tweet?tw_p=tweetbutton&via=renard_0&url=https%3A%2F%2Fgithub.com%2Frenard%2Fcidr&text=%23Cidr%20Is%20not%20as%20Dumb%20as%20Rancid%2C%20backup%20your%20network%20devices%20configuration.)
[![Follow me on twitter](http://img.shields.io/badge/Twitter-Follow-00aced.svg)](https://twitter.com/intent/follow?region=follow_link&screen_name=renard_0&tw_p=followbutton)


# NOTES

This is an early stage.

More documentation has to come. For now you have to read the code. Sorry guys!


## Dependancy

- exscript: https://github.com/knipknap/exscript
- click: https://github.com/mitsuhiko/click

## Run

Configure `cidr.yml` file with devices and run:

    ./cidr.py -v --config cidr.yml backup-config -t 64
