#pragma once

#include "Segment/Segment.h"
#include "Util.h"
#include <raylib.h>
#include <raymath.h>
#include <vector>
#include <algorithm>

class Fish
{
public:
    Fish(Vector2 origin) : m_spine(origin, 16, 8, PI / 8) {}

    void Resolve(Vector2 mousePos);
    void Draw();

private:
    void DrawPectoralFins(const Vector2 &position, float angle, float m_bodyWidth, Color color);
    void DrawVentralFins(const Vector2 &position, float angle, float m_bodyWidth, Color color);
    void DrawDorsalFin(const Vector2 &position, float angle, float m_bodyWidth, Color color);
    void DrawBody(const std::vector<Vector2> &j, const std::vector<float> &a);
    void DrawEyes(const Vector2 &position, float angle, float m_bodyWidth, Color color);

    float GetPosX(int i, float angleOffset, float lengthOffset);
    float GetPosY(int i, float angleOffset, float lengthOffset);

    float RelativeAngleDiff(float angle1, float angle2);

private:
    Segment m_spine;

    Color m_bodyColor = {58, 124, 165, 255};
    Color m_finColor = {129, 195, 215, 255};

    float m_bodyWidth[10] = {8.5, 10.125, 10.5, 10.375, 9.625, 8, 6.375, 4.75, 4, 2.375};
};
