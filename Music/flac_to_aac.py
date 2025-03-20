#!/usr/bin/python

import os
import subprocess

# Input and output directories
input_dir = "/home/lexi/Music/CompleteFLACs"
output_dir = "/home/lexi/Music/CompleteAACs"
compressed_cover = "cover.bmp"

def convert_to_aac(input_file, output_file):
    print(f"converting: {input_file} -> {output_file}")
    command = [
        #'ffmpeg', '-i', input_file, '-codec:a', 'aac', output_file

        # -c:a aac: Converts the audio codec to AAC.
        # -b:a 192k: Sets the audio bitrate (adjust as needed).
        # -c:v copy: Copies the video stream (used for album art) without re-encoding.
        # -map 0: Maps all streams (audio, metadata, album art) from the input file to the output file.
        
        #'ffmpeg', '-i', input_file, '-c:a', 'aac', '-b:a', '192k', '-c:v', 'copy', '-map', '0', output_file
        'ffmpeg', '-i', input_file, '-c:a', 'aac', '-b:a', '192k', '-c:v', 'copy', '-map', '0', output_file
    ]
    try:
        subprocess.run(command, check=True)
        print(f"converted: {input_file} -> {output_file}")
    except subprocess.CalledProcessError as e:
        print(f"error converting {input_file}: {e}")

if __name__ == "__main__":
    albums = []
    for rip_type_dir in sorted(os.listdir(input_dir)):
        for album_dir in os.listdir(input_dir+"/"+rip_type_dir):
            albums.append(input_dir+"/"+rip_type_dir+"/"+album_dir)

    for i in albums:
        path_list = os.path.split(i)

        path = i[:-len(path_list[len(path_list)-1])]

        output_path_list = path[:-1].split("/")
        output_path_precede = output_path_list[len(output_path_list)-1]
        output_path = f"{output_dir}/{output_path_precede}/"

        album_folder = path_list[len(path_list)-1]
        album_folder_list = album_folder.split(" ")
        output_album_folder = f"[AAC] {album_folder[len(album_folder_list[0])+1:]}"

        if os.path.exists(os.path.join(output_path, output_album_folder)):
            print(f"{output_album_folder}: Already exists!!")
        else:

            file_type = f".{album_folder.split(" ")[0][1:-1].lower()}"

            if file_type.upper() == ".FLAC" or file_type.upper() == ".WAV":
                pass
            else:
                print("Already probably a lossy codec, skipping...")
                continue

            print(f"Path: '{path}'\nOutput Path: '{output_path}'\nAlbum Folder: '{album_folder}'\nOutput Album Folder: '{output_album_folder}'\nCover Art: '{compressed_cover}'\nFile Type: '{file_type}'\n")

            album_output = os.path.join(output_path,output_album_folder)
            album_input = os.path.join(path,album_folder)

            if os.path.isdir(album_output):
                pass
            else:
                os.makedirs(album_output)

            for i in sorted(os.listdir(os.path.join(path,album_folder))):
                if file_type in i.lower():
                    pass
                    convert_to_aac(os.path.join(album_input, i),f"{os.path.join(album_output, i[:-len(file_type)])}.m4a")

            subprocess.run(["cp", os.path.join(album_input,compressed_cover), os.path.join(album_output,compressed_cover)])

    print("all files have been converted x3")