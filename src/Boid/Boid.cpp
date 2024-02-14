#include "Boid.h"

#include <iostream>
#include "raymath.h"
Boid::Boid()
{
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(-2.0f, 2.0f);

    Vector2 randomPosition = {(float)GetRandomValue(0, GetScreenWidth()), (float)GetRandomValue(0, GetScreenHeight())};
    this->m_position = randomPosition;

    this->m_velocity = {dis(gen), dis(gen)};
}

Boid::~Boid()
{
}

void Boid::Update()
{
    this->m_position.x += this->m_velocity.x;
    this->m_position.y += this->m_velocity.y;

    this->m_velocity.x += this->m_acceleration.x;
    this->m_velocity.y += this->m_acceleration.y;

    this->m_velocity.x = std::clamp(this->m_velocity.x, -this->m_maxSpeed, this->m_maxSpeed);
    this->m_velocity.y = std::clamp(this->m_velocity.y, -this->m_maxSpeed, this->m_maxSpeed);
}

void Boid::Draw()
{
    // draw rectangle
    // rotate rectangle
    float angle = atan2(this->m_velocity.y, this->m_velocity.x) * RAD2DEG;
    // Color according to angle
    Color color = ColorFromHSV(angle, 0.5f, 0.9f);

    DrawRectanglePro({this->m_position.x, this->m_position.y, 20, 10}, {0, 0}, angle, color);
}

void Boid::SetPosition(Vector2 position)
{
    this->m_position = position;
}

void Boid::SetVelocity(Vector2 velocity)
{
    this->m_velocity = velocity;
}

void Boid::SetAcceleration(Vector2 acceleration)
{
    this->m_acceleration = acceleration;
}

Vector2 Boid::Align(std::vector<std::shared_ptr<Boid>> &boids)
{
    // Alignment: Steering towards the average heading of local flockmates

    Vector2 sum = {0, 0};
    int count = 0;

    for (const auto &boid : boids)
    {
        float distance = Vector2Distance(this->m_position, boid->m_position);

        // Check if the boid is within a certain range (you can experiment with this range)
        if (distance > 0 && distance < 100 && boid != shared_from_this())
        {
            sum.x += boid->m_velocity.x;
            sum.y += boid->m_velocity.y;
            count++;
        }
    }

    if (count > 0)
    {
        sum.x /= static_cast<float>(count);
        sum.y /= static_cast<float>(count);

        sum = Vector2Normalize(sum); // Normalize the result
        sum.x *= m_maxSpeed;         // Scale to the maximum speed
        sum.y *= m_maxSpeed;         // Scale to the maximum speed
        sum.x -= m_velocity.x;       // Subtract current velocity to get steering force
        sum.y -= m_velocity.y;       // Subtract current velocity to get steering force
        sum = Vector2Normalize(sum); // Make sure the force does not exceed the maximum force
        sum.x *= m_maxForce;
        sum.y *= m_maxForce;
    }

    return sum;
}

Vector2 Boid::Cohesion(std::vector<std::shared_ptr<Boid>> &boids)
{
    // Cohesion: Steering to move towards the average position of local flockmates

    Vector2 sum = {0, 0};
    int count = 0;

    for (const auto &boid : boids)
    {
        float distance = Vector2Distance(this->m_position, boid->m_position);

        // Check if the boid is within a certain range (you can experiment with this range)
        if (distance > 0 && distance < 100 && boid != shared_from_this())
        {
            sum.x += boid->m_position.x;
            sum.y += boid->m_position.y;
            count++;
        }
    }

    if (count > 0)
    {
        sum.x /= static_cast<float>(count);
        sum.y /= static_cast<float>(count);

        Vector2 desired = Vector2Subtract(sum, this->m_position);
        desired = Vector2Normalize(desired); // Normalize the result
        desired.x *= m_maxSpeed;             // Scale to the maximum speed
        desired.y *= m_maxSpeed;             // Scale to the maximum speed

        Vector2 steering = Vector2Subtract(desired, m_velocity); // Calculate steering force
        steering = Vector2Normalize(steering);                   // Make sure the force does not exceed the maximum force
        steering.x *= m_maxForce;
        steering.y *= m_maxForce;

        return steering;
    }

    return sum;
}

Vector2 Boid::Separation(std::vector<std::shared_ptr<Boid>> &boids)
{
    // Separation: Steering to avoid crowding local flockmates

    Vector2 sum = {0, 0};
    int count = 0;

    for (const auto &boid : boids)
    {
        float distance = Vector2Distance(this->m_position, boid->m_position);

        // Check if the boid is within a certain range (you can experiment with this range)
        if (distance > 20 && distance < 100 && boid != shared_from_this())
        {
            Vector2 diff = Vector2Subtract(this->m_position, boid->m_position);
            diff = Vector2Normalize(diff); // Normalize the difference vector
            diff.x /= distance;            // Weight by distance
            diff.y /= distance;            // Weight by distance
            sum.x += diff.x;
            sum.y += diff.y;
            count++;
        }
    }

    if (count > 0)
    {
        sum.x /= static_cast<float>(count);
        sum.y /= static_cast<float>(count);

        sum = Vector2Normalize(sum); // Normalize the result
        sum.x *= m_maxSpeed;         // Scale to the maximum speed
        sum.y *= m_maxSpeed;         // Scale to the maximum speed
        sum.x -= m_velocity.x;       // Subtract current velocity to get steering force
        sum.y -= m_velocity.y;       // Subtract current velocity to get steering force
        sum = Vector2Normalize(sum); // Make sure the force does not exceed the maximum force
        sum.x *= m_maxForce;
        sum.y *= m_maxForce;
    }

    return sum;
}

void Boid::Flock(std::vector<std::shared_ptr<Boid>> &boids)
{
    Vector2 alignment = this->Align(boids);
    Vector2 cohesion = this->Cohesion(boids);
    Vector2 separation = this->Separation(boids);

    this->m_acceleration.x = alignment.x + cohesion.x + separation.x;
    this->m_acceleration.y = alignment.y + cohesion.y + separation.y;
}

void Boid::Edges()
{
    // steer away from edges
    if (this->m_position.x > GetScreenWidth())
    {
        this->m_position.x = 0;
    }
    else if (this->m_position.x < 0)
    {
        this->m_position.x = GetScreenWidth();
    }

    if (this->m_position.y > GetScreenHeight())
    {
        this->m_position.y = 0;
    }
    else if (this->m_position.y < 0)
    {
        this->m_position.y = GetScreenHeight();
    }
}