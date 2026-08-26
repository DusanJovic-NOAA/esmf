target_sources(esmf PRIVATE binary.cpp emitterutils.cpp nodeevents.cpp scanscalar.cpp
            convert.cpp exceptions.cpp null.cpp scantag.cpp directives.cpp
            depthguard.cpp
            exp.cpp ostream_wrapper.cpp scantoken.cpp emit.cpp memory.cpp
            parse.cpp simplekey.cpp emitfromevents.cpp nodebuilder.cpp
            parser.cpp singledocparser.cpp emitter.cpp node.cpp regex_yaml.cpp
            stream.cpp emitterstate.cpp node_data.cpp scanner.cpp tag.cpp
)

target_include_directories(esmf PRIVATE $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../include>)
