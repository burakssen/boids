#pragma once

// system headers
#include <string>
#include <vector>
#include <memory>

// raylib headers
#include <raylib.h>

// project headers

#include "Boid/Boid.h"

#if defined(PLATFORM_WEB)
#include <emscripten/emscripten.h>
#endif

class App
{
    App();

public:
    ~App();
    static App &GetInstance();
    void Run();

    void Update();
    void Draw();

private:
    void HandleInput();

private:
#if defined(PLATFORM_WEB)
    float m_width = 1920;
    float m_height = 1080;
#else
    float m_width = 800;
    float m_height = 450;
#endif

    std::string m_title = "Boids Simulation";

    std::vector<std::shared_ptr<Boid>> m_boids;
};

static void UpdateDrawFrame()
{
    App::GetInstance().Update();
    App::GetInstance().Draw();
}