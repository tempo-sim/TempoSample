import asyncio
import math
import time
import tempo.tempo_core as tc
import tempo.tempo_sensors as ts
import tempo.tempo_world as tw
import tempo.tempo_time as tt
import TempoTime.Time_pb2 as Time
from TempoScripting.Geometry_pb2 import Transform

async def main():
    await tt.set_time_mode(Time.FIXED_STEP)
    await tt.set_sim_steps_per_second(10)

    t = Transform()
    spawned = await tw.spawn_actor(type="TempoCameraActor", transform=t)
    actor = spawned.spawned_name
    print(actor)

    time.sleep(1.0)

    color_image_stream = ts.stream_color_images(sensor_name="TempoCamera", owner_name="TempoCameraActor0")
    n_frames = 100
    i = 0
    start = time.time()
    async for _ in color_image_stream:
        i += 1
        if i == n_frames:
            break
    elapsed = time.time() - start
    print(f"n_frames={n_frames}, fps={n_frames/elapsed:.2f}")

if __name__ == "__main__":
    asyncio.run(main())
