import sys, os, math, subprocess, json

FIFO_QUERY = "/tmp/eww-launcher-query"
FIFO_RESULTS = "/tmp/eww-launcher-results"




f = subprocess.Popen(['tail','-F',FIFO_QUERY],\
        stdout=subprocess.PIPE,stderr=subprocess.PIPE)

with open(FIFO_RESULTS, "a") as results:
    while True:
        line = f.stdout.readline().strip().decode("utf-8")
        print(line)
        results.write(line + "\n")
        results.flush()
    

# # Ensure FIFOs exist
# for f in [FIFO_QUERY, FIFO_RESULTS]:
#     if not os.path.exists(f):
#         os.mkfifo(f)

# with open(FIFO_RESULTS, "w") as out:
#     with open(FIFO_QUERY, "r") as query_fifo:
#         for line in query_fifo:
#             q = line.strip()

#             print("q")

#             if not q:
#                 out.write("\n")
#                 out.flush()
#                 continue

#             # # Command mode
#             # if q.startswith(">"):
#             #     out.write(json.dumps([f"Run command: {q[1:].strip()}"]) + "\n")
#             # # Math mode
#             # elif any(op in q for op in "+-*/^"):
#             #     try:
#             #         result = eval(q, {"__builtins__": {}}, {"math": math})
#             #         out.write(json.dumps([f"{q} = {result}"]) + "\n")
#             #     except Exception:
#             #         out.write(json.dumps([]) + "\n")
#             # # Else: app search
#             # else:
#             #     try:
#             #         apps = subprocess.check_output(["compgen", "-c"], text=True, executable="/bin/bash")
#             #         matches = [a for a in apps.splitlines() if q in a][:5]
#             #         out.write(json.dumps(matches) + "\n")
#             #     except:
#             #         out.write(json.dumps([]) + "\n")

#             out.write("Hello" + "\n")

#             out.flush()