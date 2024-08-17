#include "Segment.h"

Segment::Segment(Vector2 origin, int jointCount, int linkSize, float angleConstraint)
    : m_linkSize(linkSize), m_angleConstraint(angleConstraint)
{
    m_joints.push_back(origin);
    m_angles.push_back(0.0f);
    for (int i = 1; i < jointCount; ++i)
    {
        m_joints.push_back(Vector2Add(m_joints.back(), (Vector2){0, (float)linkSize}));
        m_angles.push_back(0.0f);
    }
}

void Segment::Resolve(Vector2 pos)
{
    m_angles[0] = atan2f(pos.y - m_joints[0].y, pos.x - m_joints[0].x);
    m_joints[0] = pos;
    for (size_t i = 1; i < m_joints.size(); ++i)
    {
        float curAngle = atan2f(m_joints[i - 1].y - m_joints[i].y, m_joints[i - 1].x - m_joints[i].x);
        m_angles[i] = ConstrainAngle(curAngle, m_angles[i - 1], m_angleConstraint);
        m_joints[i] = Vector2Subtract(m_joints[i - 1], Vector2Scale((Vector2){cosf(m_angles[i]), sinf(m_angles[i])}, m_linkSize));
    }
}

void Segment::FabrikResolve(Vector2 pos, Vector2 anchor)
{
    // Forward pass
    m_joints[0] = pos;
    for (size_t i = 1; i < m_joints.size(); ++i)
    {
        m_joints[i] = ConstrainDistance(m_joints[i - 1], m_joints[i], m_linkSize);
    }

    // Backward pass
    m_joints.back() = anchor;
    for (size_t i = m_joints.size() - 2; i < m_joints.size(); --i)
    {
        m_joints[i] = ConstrainDistance(m_joints[i + 1], m_joints[i], m_linkSize);
    }
}

void Segment::Draw()
{
    for (size_t i = 0; i < m_joints.size() - 1; ++i)
    {
        DrawLineV(m_joints[i], m_joints[i + 1], WHITE);
    }

    for (const auto &joint : m_joints)
    {
        DrawCircleV(joint, 16, DARKGRAY);
    }
}