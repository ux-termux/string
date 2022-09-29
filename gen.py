# pylint: disable=invalid-name, missing-module-docstring
#
# Copyright (C) 2020 by UsergeTeam@Github, < https://github.com/UsergeTeam >.
#
# This file is part of < https://github.com/UsergeTeam/Userge > project,
# and is released under the "GNU v3.0 License Agreement".
# Please see < https://github.com/uaudith/Userge/blob/master/LICENSE >
#
# All rights reserved.

import os
import asyncio

from pyrogram import Client
from dotenv import load_dotenv

if os.path.isfile("string.session"): os.remove("string.session")

API_ID = int(input("Enter API_ID: "))
API_HASH = input("Enter API_HASH: ")

with Client('string', api_id=API_ID, api_hash=API_HASH) as app:
    str_session = app.export_session_string()
    app.send_message(
        "me",
        f"#HU_STRING_SESSION\n\n```{str_session}```"
    )
    print(f"\nNoice!, #HyperGenX String Session Has Been Generated :\n\n{str_session}\n\n It has been sent To Your Saved Messages as well.")
