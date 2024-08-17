#pragma once

#include "raylib.h"
#include "raymath.h"
#include <cmath>
#include <vector>
#include <algorithm>

// Simplify the angle to be within the range [0, 2*PI)
static float SimplifyAngle(float angle)
{
    while (angle >= PI * 2)
    {
        angle -= PI * 2;
    }

    while (angle < 0)
    {
        angle += PI * 2;
    }

    return angle;
}

// Calculate the relative angle difference between two angles
static float RelativeAngleDiff(float angle, float anchor)
{
    // Normalize angles to be within [0, 2*PI)
    angle = SimplifyAngle(angle + PI - anchor);
    anchor = PI;
    return anchor - angle;
}

// Constrain the vector to be at a certain range from the anchor
static Vector2 ConstrainDistance(Vector2 pos, Vector2 anchor, float constraint)
{
    Vector2 direction = Vector2Subtract(pos, anchor);
    float distance = Vector2Length(direction);
    if (distance > constraint)
    {
        direction = Vector2Normalize(direction);
        return Vector2Add(anchor, Vector2Scale(direction, constraint));
    }
    return pos;
}

// Constrain the angle to be within a certain range from the anchor
static float ConstrainAngle(float angle, float anchor, float constraint)
{
    if (fabsf(RelativeAngleDiff(angle, anchor)) <= constraint)
    {
        return SimplifyAngle(angle);
    }

    if (RelativeAngleDiff(angle, anchor) > constraint)
    {
        return SimplifyAngle(anchor - constraint);
    }

    return SimplifyAngle(anchor + constraint);
}

static void FillPolygon(const std::vector<Vector2> &polygon, Color color)
{
    if (polygon.size() < 3)
        return; // Not a polygon

    // Determine the bounding box of the polygon
    float minX = std::numeric_limits<float>::max();
    float maxX = std::numeric_limits<float>::lowest();
    float minY = std::numeric_limits<float>::max();
    float maxY = std::numeric_limits<float>::lowest();

    for (const auto &v : polygon)
    {
        minX = std::min(minX, v.x);
        maxX = std::max(maxX, v.x);
        minY = std::min(minY, v.y);
        maxY = std::max(maxY, v.y);
    }

    // Scanline fill algorithm
    for (int y = static_cast<int>(minY); y <= static_cast<int>(maxY); ++y)
    {
        std::vector<int> intersections;

        // Find intersections of the scanline with polygon edges
        for (size_t i = 0; i < polygon.size(); ++i)
        {
            size_t j = (i + 1) % polygon.size();
            const Vector2 &v0 = polygon[i];
            const Vector2 &v1 = polygon[j];

            if ((v0.y > y && v1.y <= y) || (v1.y > y && v0.y <= y))
            {
                float x = v0.x + (y - v0.y) * (v1.x - v0.x) / (v1.y - v0.y);
                intersections.push_back(static_cast<int>(x));
            }
        }

        // Sort intersections and fill between pairs of intersections
        std::sort(intersections.begin(), intersections.end());

        // Use drawpixel

        for (size_t i = 0; i < intersections.size(); i += 2)
        {
            int x0 = std::max(static_cast<int>(minX), intersections[i]);
            int x1 = std::min(static_cast<int>(maxX), intersections[i + 1]);
            for (int x = x0; x <= x1; ++x)
            {
                DrawPixel(x, y, color);
            }
        }
    }
}

// Helper functions
static Vector2 RotatePoint(Vector2 point, float angle)
{
    float s = sinf(angle);
    float c = cosf(angle);
    return (Vector2){
        point.x * c - point.y * s,
        point.x * s + point.y * c};
}

static Vector2 RotatePoint(Vector2 point, Vector2 origin, float angle)
{
    return Vector2Add(origin, RotatePoint(Vector2Subtract(point, origin), angle));
}

static void DrawEllipsePro(Vector2 position, float radiusX, float radiusY, float rotation, Color color, int segments)
{

    std::vector<Vector2> points;
    for (int i = 0; i < segments; ++i)
    {
        float angle = 2.0f * PI * i / segments;
        points.push_back((Vector2){position.x + radiusX * cosf(angle), position.y + radiusY * sinf(angle)});
    }

    for (size_t i = 0; i < points.size(); ++i)
    {
        DrawLineV(points[i], points[(i + 1) % points.size()], color);
    }
}

#define NUM_SEGMENTS 30

static void DrawFilledEllipse(Vector2 center, Vector2 radius, float angle, Color color)
{
    // Number of segments to approximate the ellipse
    const int segments = NUM_SEGMENTS;

    // Create an array to store the vertices of the ellipse
    std::vector<Vector2> vertices(segments + 1);

    // Compute angle increment for each segment
    float angleIncrement = 2.0f * PI / segments;

    // Calculate vertices
    for (int i = 0; i < segments; ++i)
    {
        float theta = angleIncrement * i;
        Vector2 point = {
            center.x + radius.x * cosf(theta),
            center.y + radius.y * sinf(theta)};

        // Rotate the point around the center
        Vector2 pointRel = Vector2Subtract(point, center);
        pointRel = Vector2Rotate(pointRel, angle);
        vertices[i] = Vector2Add(center, pointRel);
    }

    // Close the fan loop by repeating the first vertex
    vertices[segments] = vertices[0];

    FillPolygon(vertices, color);
}
