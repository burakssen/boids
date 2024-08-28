#pragma once

#include <raylib.h>
#include <raymath.h>
#include <vector>
#include <cmath>

#include "Util.h"

class Spine
{
public:
    Spine(Vector2 origin, int jointCount, int linkSize, float angleConstraint = 2 * PI);
    void Resolve(Vector2 pos);
    void Draw();

public:
    std::vector<Vector2> m_joints;
    int m_linkSize;
    std::vector<float> m_angles;
    float m_angleConstraint;
};
