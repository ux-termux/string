import os
from pyrogram import Client

if os.path.isfile("string.session"): os.remove("string.session")

API_ID = int(input("Enter API_ID: "))
API_HASH = input("Enter API_HASH: ")

with Client(name='string', api_id=API_ID, api_hash=API_HASH, in_memory=True) as app:
    str_session = app.export_session_string()
    app.send_message(
        "me",
        f"#HU_STRING_SESSION\n\n```{str_session}```"
    )
    print(f"#HyperGenX String Session Has Been Generated :\n\n{str_session}\n\n It has been sent To Your Saved Messages as well.")
