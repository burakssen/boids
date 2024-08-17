#pragma once

// system headers
#include <string>
#include <vector>
#include <memory>

// raylib headers
#include <raylib.h>

// project headers

#include "Boid/Boid.h"

class App
{
    App();

public:
    ~App();
    static App &GetInstance();
    void Run();

private:
    void Update();
    void Draw();
    void HandleInput();

private:
    float m_width = 1512;
    float m_height = 864;

    std::string m_title = "Boids Simulation";

    std::vector<std::shared_ptr<Boid>> m_boids;
};