import subprocess

print(
    """Enter 1 if generating for Userge-X bot.
Enter 2 for Pyrogram V2.
*** DO NOT enter 2 if generating for Userge-X. ***
"""
)

while True:
    inp = input("> ")
    if inp in [1, "1"]:
        subprocess.call("python3 -m pip install pyrogram==1.4.7", shell=True)
        break
    elif inp in [2, "2"]:
        subprocess.call("python3 -m pip install pyrogram==2.0.57", shell=True)
        break
    else:
        print("Wrong Input\nTry Again.")

subprocess.call("clear",shell=True)

from pyrogram import Client, __version__

API_ID = int(input("Enter API_ID: "))
API_HASH = input("Enter API_HASH: ")

if __version__ == "1.4.7":
    client = Client(session_name=":memory:", api_id=API_ID, api_hash=API_HASH)
else:
    client = Client(name="string", api_id=API_ID, api_hash=API_HASH, in_memory=True)

with client as app:
    str_session = app.export_session_string()
    app.send_message("me", f"#HU_STRING_SESSION\n\n```{str_session}```")
    print(f"#HyperGenX String Session Has Been Generated :\n\n{str_session}\n\n It has been sent To Your Saved Messages as well.")
