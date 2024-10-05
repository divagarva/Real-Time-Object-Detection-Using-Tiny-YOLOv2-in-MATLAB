
clc;
close all;
clear all;

% Load the pretrained Tiny YOLOv2 object detection network
model = 'tiny-yolov2-coco'; % Use valid model name
detector = yolov2ObjectDetector(model);

% Load an image
image = imread('tiger.jpg'); % Replace with the path of your image

% Detect objects in the image
[bboxes, scores, labels] = detect(detector, image);

% Display the image
figure;
imshow(image);
hold on;

% Annotate detected objects
for i = 1:size(bboxes,1)
    bbox = bboxes(i, :);
    score = scores(i);
    label = labels(i);
    
    % Draw the bounding box
    rectangle('Position', bbox, 'EdgeColor', 'g', 'LineWidth', 2);

    % Display the label and confidence score
    labelStr = sprintf('%s: %.2f', label, score);
    text(bbox(1), bbox(2) - 10, labelStr, 'Color', 'y', 'FontSize', 12, 'FontWeight', 'bold');
end

hold off;

% Title of the plot
title('Object Detection using Tiny YOLOv2');
