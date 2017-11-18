#!/usr/bin/env python3
from telegram.ext import Updater, CommandHandler, CallbackQueryHandler
import telegram

import logging

import subprocess
import os

def start(bot, update):
    send_portfolio(bot, update.message.from_user.id)

def callback(bot, update):
    query = update.callback_query
    try:
        user_id = int(query.data)
        send_portfolio(bot, user_id)
    except:
        logging.warning('Invalid callback data in update "{}"'.format(update))
    query.edit_message_reply_markup()

def error(bot, update, error):
    logging.warning('Update "%s" caused error "%s"' % (update, error))

def send_portfolio(bot, user_id):
    # run project main on <user_id>.json
    filename = '{}.json'.format(user_id)
    if os.path.isfile(filename):
        ret = subprocess.check_output(
            [ './report',
                '-s',
                '-o', 'value',
                '-d',
                '{}.json'.format(user_id) ]
            , universal_newlines = True )
        ret = "```\n{:s}\n```".format(ret)
        btn = telegram.InlineKeyboardButton('Refresh', callback_data='{}'.format(user_id))
        kb  = telegram.InlineKeyboardMarkup([[btn]])
        bot.send_message(user_id, text=ret, parse_mode='markdown', reply_markup=kb)
    else:
        ret = 'You are not registrated. This bot will not help you.'
        bot.send_message(user_id, text=ret, parse_mode='markdown')

def read_api_token():
    try:
        with open ("api.token", "r") as f:
           t = f.read().splitlines()[0]
        return(t)
    except Exception as e:
        print("Problem while reading token from api.token file")
        exit(1)

updater = Updater(token=read_api_token())

updater.dispatcher.add_handler(CommandHandler('start', start))
updater.dispatcher.add_handler(CallbackQueryHandler(callback))
updater.dispatcher.add_error_handler(error)

# Poll once per second should be enough
updater.start_polling(poll_interval=1)
updater.idle()
