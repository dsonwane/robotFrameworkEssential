from xmlrpc.server import SimpleXMLRPCServer

class CalculatorLibrary:
    def add(self, a, b):
        return a + b

    def subtract(self, a, b):
        return a - b

def main():
    calculator = CalculatorLibrary()
    server = SimpleXMLRPCServer(("localhost", 8080))
    server.register_instance(calculator)
    print("Calculator server is running on port  ...", server)
    server.serve_forever()

if __name__ == "__main__":
    main()
