SIP Tracing Dockerfile
======================

## Running the Container

    docker run -d --privileged -v <VOLUME>:/var/log/sipdump --name sipdump voxbox/sipdump

## Running in Swarm mode

    docker swarm init
    docker stack deploy -c docker-compose.yml sipdump

### Configuration

### Volumes


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/t2_airtime. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The container is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the T2Airtime project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/t2_airtime/blob/master/CODE_OF_CONDUCT.md).