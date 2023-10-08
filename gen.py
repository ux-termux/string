from pyrogram import Client

API_ID = int(input("Enter API_ID: "))
API_HASH = input("Enter API_HASH: ")

client = Client(name="string", api_id=API_ID, api_hash=API_HASH, in_memory=True)

with client as app:
    str_session = app.export_session_string()
    app.send_message("me", f"#SESSION_STRING\n\n<code>{str_session}</code>")
    print(f"String Session Has Been Generated :\n\n{str_session}\n\n It has been sent To Your Saved Messages as well.")
