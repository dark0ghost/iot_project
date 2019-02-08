import aiohttp
import asyncio
from serial import Serial


ser = Serial(
             "COM3",
             115200
             )


async def request(url):
 async with aiohttp.ClientSession() as session:
    async with session.get(url) as response:
      return 


async def main():
    s = ser.read(100)

    res=str(s.split()[1]).replace("'"," ").replace("b"," ").replace("  ","")
    await request(res)



while 1 :
 t = time.time()
 loop = asyncio.get_event_loop()
 loop.run_until_complete(main())
