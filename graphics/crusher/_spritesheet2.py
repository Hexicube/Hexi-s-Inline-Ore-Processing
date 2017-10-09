from PIL import Image  
import os, math, time  
import sys
import argparse

# Remember before running script!
# pip install Pillow

parser = argparse.ArgumentParser()
parser.add_argument("frame_directory", help="The directory where you store the frames you want to process, path must end in /")
parser.add_argument("output_directory", help="The directory where we will place your spritesheets, ex sheets/spritesheet will get you sheets/spritesheet_1.png")
parser.add_argument("--first_frame", type=int, help="First frame in folder to add to sheet, default is 1")
parser.add_argument("--last_frame", type=int, help="Last frame in folder to add to sheet, default is number of frames")
parser.add_argument("--resolution", type=int, help="Max resolution of the sheet. 500 means it will never output sheets larger than 500x500. Defaults to 2048.")
parser.add_argument("--halve", type=bool, help="Havle resolution of each sprite. ex 512x512 goes to 256x256.")
parser.add_argument("--framestep", type=int, help="Only use every nth frame. ex 3 will use frame number 1, 4, 7 and 10. Defaults to 1.")
args = parser.parse_args()


frame_directory = sys.argv[1]
output_directory = sys.argv[2] # args.output_directory as well
if args.last_frame:
	last_frame = args.last_frame
else:
	last_frame = 999999 # So I guess I am saying max 1m frames. If you can load all that into memory you can also change this variable.

if args.first_frame:
	first_frame = args.first_frame
else:
	first_frame = -1

if not args.halve:
	halveResolution = False
else:
	halveResolution = True

if args.resolution:
	max_resolution = args.resolution
else:
	max_resolution = 2048

framestep = 1
if args.framestep:
	framestep = args.framestep

print("Specified resolution: "+str(args.resolution))
print("Computed resolution: "+str(max_resolution))
print("Making spritesheet from "+frame_directory+", outputting to "+output_directory)

files = os.listdir(frame_directory)  
files.sort()
frames = []

jadasfg = 1
for current_file in files:
	# Only make spritesheets in the given range (if set by optional arguments)
	if jadasfg >= first_frame and jadasfg <= last_frame and jadasfg % framestep == 0:
		try:
			with Image.open(frame_directory + current_file) as im :
				frames.append(im.getdata())#.getdata()
		except:
			print(current_file + " is not a valid image")
	jadasfg += 1

tile_width = frames[0].size[0]
tile_height = frames[0].size[1]
if halveResolution:
	tile_width = math.floor(tile_width / 2)
	tile_height = math.floor(tile_height / 2)

max_frames_width = math.floor(max_resolution / tile_width)
max_frames_height = math.floor(max_resolution / tile_height)
max_frames_sheet = max_frames_height * max_frames_width
number_of_spritesheets_as_str = str(math.ceil(len(frames)/max_frames_sheet))
print(str(len(frames))+" frames with a maximum of "+str(max_frames_sheet)+" per spritesheet, making "+number_of_spritesheets_as_str+" spritesheets.")

spritesheet_width = max_frames_width * tile_width
spritesheet_height = max_frames_height * tile_height

def chunks(l, n):
    """Yield successive n-sized chunks from l."""
    for i in range(0, len(l), n):
        yield l[i:i + n]
# Divide our frames into different spritesheets that all can be smaller than 2048x2048
# produces lists inside a list, like [[],[],[]]
spritesheets = list(chunks(frames, max_frames_sheet))

# create spritesheets
for frames in spritesheets:
	spritesheet = Image.new("RGBA",(int(spritesheet_width), int(spritesheet_height)))

	for current_frame in frames :  
		valueTop = math.floor((frames.index(current_frame))/max_frames_width)
		valueLeft = (frames.index(current_frame) % max_frames_width)
		if halveResolution:
			current_frame = current_frame.resize((math.floor(current_frame.size[0]/2), math.floor(current_frame.size[1]/2)))
		top = tile_height * valueTop
		left = tile_width * valueLeft
		bottom = top + tile_height
		right = left + tile_width

		box = (left,top,right,bottom)
		box = [int(i) for i in box]
		cut_frame = current_frame.crop((0,0,tile_width,tile_height))

		spritesheet.paste(cut_frame, box)
		
	if len(spritesheets) > 1:
		spritesheet.save(output_directory + "_"+str(spritesheets.index(frames))+".png", "PNG")
	else:
		spritesheet.save(output_directory + ".png", "PNG")
	
	print("Created sheet "+str(spritesheets.index(frames)+1)+" out of "+number_of_spritesheets_as_str)