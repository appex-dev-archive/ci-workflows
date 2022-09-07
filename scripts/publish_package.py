import os
import subprocess
import sys

only_version = sys.argv[1]

print("Configuring git ...")
subprocess.run(["git", "config", "--global", "user.email", os.environ['GIT_EMAIL']], check=True)
subprocess.run(["git", "config", "--global", "user.name", os.environ['GIT_USERNAME']], check=True)
subprocess.run(["git", "pull"], check=True)

print("Tagging package version ...")
output = subprocess.run(["git", "describe", "--tags", "--abbrev=0"], capture_output=True, check=True)
tag = output.stdout.decode("utf-8").replace("\n", "")
subprocess.run(["npm", "version", tag, "-m", f'"Release version: {tag}"'], check=True)
subprocess.run(["git", "push", "origin", "HEAD:main"], check=True)
print(f'Version {tag} tagged successfully')

if only_version == "false":
    print("Publishing package")
    subprocess.run(["npm", "publish"], check=True)
    print("Package published successfully")