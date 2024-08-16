#include "App.h"

App::App()
{
    InitWindow(this->m_width, this->m_height, this->m_title.c_str());
    SetTargetFPS(60);

    for (int i = 0; i < 100; i++)
    {
        this->m_boids.push_back(std::make_shared<Boid>());
    }
}

App::~App()
{
    CloseWindow();
}

App &App::GetInstance()
{
    static App instance;
    return instance;
}

void App::Run()
{
#if defined(PLATFORM_WEB)
    emscripten_set_main_loop(UpdateDrawFrame, 0, 1);
#else
    while (!WindowShouldClose())
    {
        this->HandleInput();
        this->Update();
        this->Draw();
    }
#endif
}

void App::Update()
{
    for (auto &boid : this->m_boids)
    {
        boid->Edges();
        boid->Flock(this->m_boids);
        boid->Update();
    }
}

void App::Draw()
{
    BeginDrawing();
    ClearBackground(BLACK);
    for (auto &boid : this->m_boids)
    {
        boid->Draw();
    }
    EndDrawing();
}

void App::HandleInput()
{
}