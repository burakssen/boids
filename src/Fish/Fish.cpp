#include "Fish.h"

void Fish::Resolve(Vector2 mousePos)
{
    Vector2 headPos = m_spine.m_joints[0];

    // Calculate the angle of the head to the mouse
    float headAngle = atan2f(mousePos.y - headPos.y, mousePos.x - headPos.x);

    // Calculate the angle difference between the head and the spine
    float angleDiff = RelativeAngleDiff(headAngle, m_spine.m_angles[0]);

    // Rotate the head towards the mouse
    m_spine.m_angles[0] += angleDiff * 0.1f;

    // Rotate the spine joints
    for (size_t i = 1; i < m_spine.m_joints.size(); ++i)
    {
        float curAngle = atan2f(m_spine.m_joints[i - 1].y - m_spine.m_joints[i].y, m_spine.m_joints[i - 1].x - m_spine.m_joints[i].x);
        m_spine.m_angles[i] = ConstrainAngle(curAngle, m_spine.m_angles[i - 1], m_spine.m_angleConstraint);
    }

    // Resolve the spine
    m_spine.Resolve(mousePos);
}

void Fish::Draw()
{
    DrawVentralFins(m_spine.m_joints[0], m_spine.m_angles[0], m_bodyWidth[0], m_finColor);
    DrawPectoralFins(m_spine.m_joints[1], m_spine.m_angles[1], m_bodyWidth[1], m_finColor);
    DrawBody(m_spine.m_joints, m_spine.m_angles);
    DrawEyes(m_spine.m_joints[0], m_spine.m_angles[0], m_bodyWidth[0], m_finColor);
    DrawDorsalFin(m_spine.m_joints[0], m_spine.m_angles[0], m_bodyWidth[0], m_finColor);
}

void Fish::DrawPectoralFins(const Vector2 &position, float angle, float m_bodyWidth, Color color)
{
    DrawFilledEllipse({position.x - cosf(angle) * m_bodyWidth / 6 + sinf(angle) * m_bodyWidth / 2, position.y - sinf(angle) * m_bodyWidth / 6 - cosf(angle) * m_bodyWidth / 2}, {7.5, 12.5}, angle - PI / 8, color);
    DrawFilledEllipse({position.x - cosf(angle) * m_bodyWidth / 6 - sinf(angle) * m_bodyWidth / 2, position.y - sinf(angle) * m_bodyWidth / 6 + cosf(angle) * m_bodyWidth / 2}, {7.5, 12.5}, angle + PI / 8, color);
    Vector2 jointPos = m_spine.m_joints[m_spine.m_joints.size() - 8];
    float jointAngle = m_spine.m_angles[m_spine.m_joints.size() - 8];
    DrawFilledEllipse({jointPos.x + cosf(jointAngle) * m_bodyWidth / 6 + sinf(jointAngle) * m_bodyWidth / 2, jointPos.y + sinf(jointAngle) * m_bodyWidth / 6 - cosf(jointAngle) * m_bodyWidth / 2}, {3, 5}, jointAngle - PI / 4, color);
    DrawFilledEllipse({jointPos.x + cosf(jointAngle) * m_bodyWidth / 6 - sinf(jointAngle) * m_bodyWidth / 2, jointPos.y + sinf(jointAngle) * m_bodyWidth / 6 + cosf(jointAngle) * m_bodyWidth / 2}, {3, 5}, jointAngle + PI / 4, color);
}

void Fish::DrawVentralFins(const Vector2 &position, float angle, float m_bodyWidth, Color color)
{
    // Tail fin
    Vector2 jointPos = m_spine.m_joints[m_spine.m_joints.size() - 6];
    float jointAngle = m_spine.m_angles[m_spine.m_joints.size() - 6];
    DrawFilledEllipse({jointPos.x + cosf(jointAngle) * m_bodyWidth / 2, jointPos.y + sinf(jointAngle) * m_bodyWidth / 2}, {15 / 4, 2 * sinf(jointAngle)}, jointAngle + PI / 8, color);

    // Tail fin
    jointPos = m_spine.m_joints[m_spine.m_joints.size() - 6];
    jointAngle = m_spine.m_angles[m_spine.m_joints.size() - 6];
    DrawFilledEllipse({jointPos.x + cosf(jointAngle) * m_bodyWidth / 2, jointPos.y + sinf(jointAngle) * m_bodyWidth / 2}, {5, 10 * sinf(jointAngle) / 4}, jointAngle - PI / 16, color);
}

void Fish::DrawDorsalFin(const Vector2 &position, float angle, float m_bodyWidth, Color color)
{
    Vector2 jointPos = m_spine.m_joints[4];
    float jointAngle = m_spine.m_angles[4];
    DrawFilledEllipse({jointPos.x + cosf(jointAngle) * m_bodyWidth, jointPos.y + sinf(jointAngle) * m_bodyWidth}, {50 / 4, 2 * sinf(jointAngle) / 4}, jointAngle, color);
}

void Fish::DrawBody(const std::vector<Vector2> &j, const std::vector<float> &a)
{
    if (j.size() < 10 || a.size() < 10)
        return; // Ensure valid sizes

    std::vector<Vector2> bodyVertices;

    // Calculate the body vertices
    for (int i = 0; i < 10; ++i)
    {
        bodyVertices.push_back({GetPosX(i, PI / 2, 0), GetPosY(i, PI / 2, 0)});
    }
    bodyVertices.push_back({GetPosX(9, PI, 0), GetPosY(9, PI, 0)});

    for (int i = 9; i >= 0; --i)
    {
        bodyVertices.push_back({GetPosX(i, -PI / 2, 0), GetPosY(i, -PI / 2, 0)});
    }
    bodyVertices.push_back({GetPosX(0, -PI / 6, 0), GetPosY(0, -PI / 6, 0)});
    bodyVertices.push_back({GetPosX(0, 0, 4), GetPosY(0, 0, 4)});
    bodyVertices.push_back({GetPosX(0, PI / 6, 0), GetPosY(0, PI / 6, 0)});

    // Ensure the bodyVertices array is closed
    bodyVertices.push_back(bodyVertices[0]);
    // Fill the body
    FillPolygon(bodyVertices, BLUE);

    // Draw arcs across the body width
    for (int i = 0; i < 9; ++i)
    {

        DrawLineBezier(bodyVertices[i], bodyVertices[bodyVertices.size() - i - 1], 2, DARKBLUE);
    }
}

void Fish::DrawEyes(const Vector2 &position, float angle, float m_bodyWidth, Color color)
{
    DrawCircle(position.x + cosf(angle) * m_bodyWidth / 2 - sinf(angle) * m_bodyWidth / 2.0f, position.y + sinf(angle) * m_bodyWidth / 2 + cosf(angle) * m_bodyWidth / 2.0f, 2.5, color);
    DrawCircle(position.x + cosf(angle) * m_bodyWidth / 2 + sinf(angle) * m_bodyWidth / 2.0f, position.y + sinf(angle) * m_bodyWidth / 2 - cosf(angle) * m_bodyWidth / 2.0f, 2.5, color);
}

float Fish::GetPosX(int i, float angleOffset, float lengthOffset)
{
    return m_spine.m_joints[i].x + cosf(m_spine.m_angles[i] + angleOffset) * (m_bodyWidth[i] + lengthOffset);
}

float Fish::GetPosY(int i, float angleOffset, float lengthOffset)
{
    return m_spine.m_joints[i].y + sinf(m_spine.m_angles[i] + angleOffset) * (m_bodyWidth[i] + lengthOffset);
}

float Fish::RelativeAngleDiff(float angle1, float angle2)
{
    float diff = angle2 - angle1;
    while (diff > PI)
        diff -= 2 * PI;
    while (diff < -PI)
        diff += 2 * PI;
    return diff;
}