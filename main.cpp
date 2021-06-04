#include <iostream>
#include <gtest/gtest.h>

class TestFixture : public ::testing::Test {

protected:
    void SetUp(){
    std::cout << "SetUp()" << std::endl;
    }

    void TearDown(){
    std::cout << "TearDown()" << std::endl;
    }
};



TEST_F (TestFixture, shouldCompile) {
    std::cout << "shouldCompile" << std::endl;
    std::cout << "GOGOGOGOGOGOGO" << std::endl;
    ASSERT_TRUE(true); // works, maybe optimized out?

    ASSERT_NEAR(1.0, 3.0, 1.0e-11);

    // ASSERT_TRUE("hi" == "hallo"); // undefined reference

}

int main(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    // return (0);
    return RUN_ALL_TESTS();
}