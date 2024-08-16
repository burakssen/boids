#include "App/App.h"

int main()
{
    App &app = App::GetInstance();
    app.Run();
    return 0;
}