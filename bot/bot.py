from telegram.ext import Updater, CommandHandler

import subprocess
import os

def start(bot, update):
    update.message.reply_text('Welcome')

def portfolio(bot, update):
    # run project main on <user_id>.json
    filename = '{}.json'.format(update.message.from_user.id)
    if os.path.isfile(filename):
        ret = subprocess.check_output(
            [ '../main.native',
                '{}.json'.format(update.message.from_user.id) ]
            , universal_newlines = True )
        ret = "```\n{:s}\n```".format(ret)
    else:
        ret = 'You are not registered!'
    bot.send_message(update.message.chat_id, text=ret, parse_mode='markdown')
    #  parse_mode=telegram.ParseMode.MARKDOWN
    #  update.message.reply_text(f.read())
updater = Updater('437620095:AAE8Gtpxu8D8W_nJZ238I0Q_mBOm6WylFVk')

updater.dispatcher.add_handler(CommandHandler('start', start))
updater.dispatcher.add_handler(CommandHandler('do', portfolio))

# Poll once per second should be enough
updater.start_polling(poll_interval=1)
updater.idle()
