import rsa
import json
import base64

############## Load server pv n pb key

with open("public.pem", "rb") as f:
    public_key = rsa.PublicKey.load_pkcs1(f.read())

with open("private.pem", "rb") as f:
    private_key = rsa.PrivateKey.load_pkcs1(f.read())


############## Testing for post and convert to json

# msg = '{"name": "Asano Shogo", "age": 19, "team": "Takamatsu-Shougyou"}'

# msg = '{"name":"Hosoda Yuuma","password":"asanoshogo","phone_number": "08129139393","token": "ff82e04c8f8b8aa3007063337904de80aff732669b0c8da785ab2d56707ef453","nik": "1231313320"}'

msg = "MsSiq5MKg4H5R2djJtndoao+h41Fqk7m3AU23huS8jsMH1Jr81i/iJxanYmhj3HX8uGtmLrAq7iTJjvIP58S626gdTW/A13AHyjqaZotrjFhimpsztRp2PnUP0j0byylv44oku8opRly6/JRqWxYEj0zrDWRjBqc1w6HX2OY/q6bQOFUiVlNBmY8O7s06eMwr8sbLWs/5H2oSn+gEWS2f7AFrUlhZPSXil3iuD+TLIW+m8bOfC1WommNZn3QaLuXxGfwPT6ylgN9Z50hXu7gEXHGjjfiSjMF8WoowmVoxC2dw6afOIp7JLXwGz1b3TjemOAkr1l4DT+M9SMX9mI/bQ=="

"""
b'\x1aUon\xa0\xae^S\x86U\xf8^\xfa1\xc7\x10\xcbK!r\x17\xfe\xa3{\x17\xa3\xc6k\xbb\x9bB\x8c\xaa\xc2\xee\xea\x85\xfd\x93\xb6D\x93\xf6E\xdf\xaaY\x92\x1d\xf8\x00\xe4\xa0|\xb9\t\x1c\xac\x02\x9fr\xb6\xc6Q\xdd\xf3\xe0\x89\x99\x8d\x8d\x11+\x8a\xba\xeey\x8bo\x8eX\xca\xd2\xf3\x99\x85\x10\x96\xad\x9d\xf7g\x9e\xc9!IF\x99\x18WK"\xa0\xacx1\x10\xee\xab\xcb=\xaf\x98\r\x0f\x7f\xce^\x1d\x0bS\x1b\xfa\xeb&\x91\x1a\x16G\xbb]"\x03\x13X\xdd\x8e\x18\xaa\xc3\x90\xa8\x01\x08\xc7\xb6\xc3\xe1\xe6\xcd\x1d\xaa\x9a\xa3\xebL\x9f\xca\\(k\xee\xf7\xdb(8*?\xd9\xe4\x9d\xaf9\x12K\x8f`\x14}\xc9\xdc\xda\xdf\xf7}\xd3\x0b\\\xcaaD\x10\xb0\x01\xc0\xf2|\xb1rHk!i\xde7\x0f\x13\xdejTpK\xcc\x1dC\xc2\xdc{-\x95\x06\xb7\xb2\xaa\x1c\xd1x\x19\xbe\xca#\xf2\xdf8uF\x8f?\x01\x00\x9fRj\x97\xc1\x034z\x0b\xa9@7\xc2\x00V;'
"""

byte_msg = base64.urlsafe_b64decode(msg)

dec_msg = rsa.decrypt(byte_msg, private_key)
json_msg = json.loads(dec_msg)
print(json_msg['name'])

# enc_msg = rsa.encrypt(msg.encode(), public_key)
# print(enc_msg)

# dec_msg = rsa.decrypt(enc_msg, private_key)

# clear_msg = dec_msg.decode()
# print(json.loads(clear_msg))
# print(enc_msg)

# x = json.loads(clear_msg)

# print(x["team"])

########### Generate keys

# pbkey, pvkey = rsa.newkeys(2048)

# with open("public.pem", "wb") as f:
#     f.write(pbkey.save_pkcs1("PEM"))
# with open("private.pem", "wb") as f:
#     f.write(pvkey.save_pkcs1("PEM"))

# with open("private.pem", "wb") as f:
#     private_key = rsa.PrivateKey.load_pkcs1(f.read())

############## Signaturing

# signature = rsa.sign(msg.encode(), pvkey, "SHA-256")

# print(rsa.verify(msg.encode(), signature, pbkey))
