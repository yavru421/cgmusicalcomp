import urllib.request
import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

url = "https://en.wikipedia.org/w/api.php?action=query&prop=revisions&rvslots=*&rvprop=content&format=json&titles=Chicken_Dance"
req = urllib.request.Request(url, headers={'User-Agent': 'AntigravityBot/1.0'})
try:
    with urllib.request.urlopen(req, timeout=10) as resp:
        data = json.loads(resp.read().decode('utf-8'))
        pages = data['query']['pages']
        for k, v in pages.items():
            content = v['revisions'][0]['slots']['main']['*']
            for line in content.splitlines():
                if "dominant" in line.lower() or "piece is often" in line.lower():
                    print("FULL LINE:\n", line)
except Exception as e:
    print("Error:", e)
