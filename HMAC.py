import hashlib
from random import randbytes

# key = randbytes(64)
key = b'0000000000000000000000000000000000000000000000000000000000000000'

ipad = b'\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36'\
       b'\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36'\
       b'\x36\x36\x36\x36\x36\x36\x36\x36\x36\x36'

opad = b'\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c'\
       b'\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c'\
       b'\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c\x5c'


def mac(k, m):
    tagf = h(xor(k, opad) + h(xor(k, ipad)+m))
    return tagf


def vrfy(k, m, t):
    if h(xor(k, opad) + h(xor(k, ipad)+m)) == t:
        return True
    else:
        return False


def h(data):
    s = hashlib.sha256()
    s.update(data)
    return s.digest()


def xor(bytes1, bytes2):
    if len(bytes1) != len(bytes2):
        raise ValueError("Bytes objects must be same length to XOR them.")
    output = b''
    for i in range(len(bytes1)):
        output = output + bytes([bytes1[i] ^ bytes2[i]])
    return output


if __name__ == "__main__":

    m2 = b"Sherman is Better than Mocha"
    tag = mac(key, m2)
    verify = vrfy(key, m2, tag)
    print("Message:\n" + str(m2.decode()) + "\nTag:\n" + str(tag) + "\nKey:\n" + str(key.decode()) + "\nVerify:\n" + str(verify))
