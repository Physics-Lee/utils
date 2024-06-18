from PIL import Image, ImageSequence
import os

def gif_to_png(gif_file_name, output_folder):
    # Ensure the output directory exists, create if necessary
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    # Open the GIF file
    with Image.open(gif_file_name) as img:
        # Iterate over each frame in the GIF
        for i, frame in enumerate(ImageSequence.Iterator(img)):
            # Convert frame to RGB (necessary if the GIF has transparency)
            frame = frame.convert('RGB')
            # Save each frame as a PNG
            frame.save(f'{output_folder}/output_frame_{i+1}.png')

# Specify the path to your GIF file and the output folder
gif_file_name = 'F:\\Desktop\\temp.gif'
output_folder = 'F:\\Desktop\\output_frames'

# Call the function
gif_to_png(gif_file_name, output_folder)