#pragma once

#include <random>
#include <vector>
#include <memory>
#include <algorithm>

#include <raylib.h>

#include "Fish/Fish.h"

class Boid : public std::enable_shared_from_this<Boid>
{
public:
    Boid();
    ~Boid();

    void Update();
    void Draw();

    void SetPosition(Vector2 position);
    void SetVelocity(Vector2 velocity);
    void SetAcceleration(Vector2 acceleration);

    Vector2 Align(std::vector<std::shared_ptr<Boid>> &boids);
    Vector2 Cohesion(std::vector<std::shared_ptr<Boid>> &boids);
    Vector2 Separation(std::vector<std::shared_ptr<Boid>> &boids);

    void Flock(std::vector<std::shared_ptr<Boid>> &boids);
    void Edges();

private:
    Vector2 m_position = {(float)GetScreenWidth() / 2, (float)GetScreenHeight() / 2};
    Vector2 m_velocity;
    Vector2 m_acceleration;

    float m_maxForce = 0.2f;
    float m_maxSpeed = 4.0f;

    std::shared_ptr<Fish> m_fish = std::make_shared<Fish>(m_position);
};