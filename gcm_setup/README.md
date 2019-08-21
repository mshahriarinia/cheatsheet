
__Summary__
1. Create VM instance
2. Add static IP to it
3. Install on VM

```
sudo apt install python3-pip python3-dev
echo "alias python='python3'" >> ~/.bashrc
sudo -H pip3 install --upgrade pip
sudo -H pip3 install virtualenv
virtualenv env
source env/bin/activate
pip install jupyter
pip install tensorflow==2.0.0-beta1
jupyter notebook --no-browser --port=8889
```

4. Create SSH tunnel to VM and port forward:
```
gcloud compute ssh --zone "us-central1-a" "mortezas-instance-1" -- -NL 8889:localhost:8889
```

http://localhost:8889


# Launch a Virtual Instance

To launch a virtual instance, go to the Compute Engine menu on the left column of your dashboard and click on VM instances. Then click on the blue CREATE button on the next page. This will take you to a page that looks like the screenshot below. (NOTE: Please carefully read the instructions in addition to looking at the screenshots. The instructions tell you exactly what values to fill in).

Make sure that the Zone is set to be us-west1-b (east-1c for deepintent) (especially for assignments where you need to use GPU instances). Under Machine type pick the 8 vCPUs option. Click on the customize button under Machine type and make sure that the number of cores is set to 8 and the number of GPUs is set to None (we will not be using GPUs in assignment 1 and this tutorial will be updated with instructions for GPU usage). Click on the Change button under Boot disk, choose OS images, check Ubuntu 16.04 LTS and click on the blue select button. Check Allow HTTP traffic and Allow HTTPS traffic. Click on disk and then Disks and uncheck Delete boot disk when instance is deleted (Note that the “Disks” option may be hiding under an expandable URL at the bottom of that webform). Click on the blue Create button at the bottom of the page. You should have now successfully created a Google Compute Instance, it might take a few minutes to start running. Your screen should look something like the one below. When you want to stop running the instance, click on the blue stop button above.

```
wget http://cs231n.stanford.edu/assignments/2017/spring1617_assignment1.zip
sudo apt-get install unzip
unzip spring1617_assignment1.zip
cd assignment1 
./setup_googlecloud.sh  # You will be prompted to enter Y/N at various times during the download. Press enter for every prompt.
```

If you had no errors, you can proceed to work with your virtualenv as normal. I.e. run
`source env/bin/activate`
in your assignment directory to load the venv, and run
`deactivate`
to exit the venv.

NOTE: The instructions above will run everything needed using Python 2.7. If you would like to use Python 3.5 instead, edit setup_googlecloud.sh to replce the line
`virtualenv env`
with
`virtualenv -p python3 env`


before running
./setup_googlecloud.sh


# Using Jupyter Notebook with Google Compute Engine

## Set a static IP for your machine: 

click on the 3 line icon next to the Google Cloud Platform button on the top left corner of your screen, go to Networking and External IP addresses. 

To have a static IP address, change Type from Ephemeral to Static. Enter your preffered name for your static IP, mine is assignment-1 (see screenshot below). And click on Reserve. Remember to release the static IP address when you are done because according to this page Google charges a small fee for unused static IPs. Type should now be set to Static.

Take note of your Static IP address (circled on the screenshot below).   35.196.247.146

## Adding a Firewall rule
One last thing you have to do is adding a new firewall rule allowing TCP acess to a particular <PORT-NUMBER>. I usually use 7000 or 8000 for <PORT-NUMBER>. Click on the 3 line icon at the top of the page next to Google Cloud Platform. On the menu that pops up on the left column, go to Networking and Firewall rules (see the screenshot below).
  
Click on the blue CREATE FIREWALL RULE button. Enter whatever name you want: I used assignment1-rules. Enter 0.0.0.0/0 for Source IP ranges and tcp:<PORT-NUMBER> for Allowed protocols and ports where <PORT-NUMBER> is the number you used above. Click on the blue Create button. See the screen shot below. 

Create target tags: wikilinks, then edit the vm instance and add wikilinks to network tags

```
Configuring Jupyter Notebook
```

The following instructions are excerpts from this page that has more detailed instructions.
```
morteza@wikilinks:~$ virtualenv env
New python executable in /home/morteza/env/bin/python
Installing setuptools, pip, wheel...done.
morteza@wikilinks:~$ source ~/env/bin/activate  # same dir as the virtual env above
(env) morteza@wikilinks:~$ ./setup_googlecloud.sh
(env) morteza@wikilinks:~$ pip install -r requirements.txt  # remove site=0.0.1   reddit link
```

On your GCE instance check where the Jupyter configuration file is located (Mine was in `/home/timnitgebru/.jupyter/jupyter_notebook_config.py`):
`ls ~/.jupyter/jupyter_notebook_config.py`

If it doesn’t exist, create one:
```
jupyter notebook --generate-config   # Remember to activate your virtualenv ('source env/bin/activate') so you can actually run jupyter :)
```

Using your favorite editor (vim, emacs etc…) add the following lines to the config file, (e.g.: `/home/timnitgebru/.jupyter/jupyter_notebook_config.py`):
```
c = get_config()

c.NotebookApp.ip = '*'

c.NotebookApp.open_browser = False

c.NotebookApp.port = <PORT-NUMBER>
```

Where <PORT-NUMBER> is the same number you used in the prior section. Save your changes and close the file. e.g. 5624


## Launching and connecting to Jupyter Notebook

The instructions below assume that you have SSH’d into your GCE instance using the prior instructions, have already downloaded and unzipped the current assignment folder into assignmentX (where X is the assignment number), and have successfully configured Jupyter Notebook.

If you are not already in the assignment directory, cd into it by running the following command:
cd assignment1 


If you haven’t already done so, activate your virtualenv by running:
`source .env/bin/activate`

Launch Jupyter notebook using:
`jupyter-notebook --no-browser --port=<PORT-NUMBER>`


Where <PORT-NUMBER> is what you wrote in the prior section.
  
On your local browser, if you go to `http://<YOUR-EXTERNAL-IP-ADDRESS>:<PORT-NUMBER>`, you should see something like the screen below. My value for <YOUR-EXTERNAL-IP-ADDRESS> was 104.196.224.11 as mentioned above. You should now be able to start working on your assignments.


http://35.196.247.146:7000/tree

