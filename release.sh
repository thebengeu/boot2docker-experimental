#!/bin/bash
export GITHUB_USER=ahbeng
export GITHUB_REPO=boot2docker-experimental
image="${GITHUB_USER}/${GITHUB_REPO}"

docker pull "${image}"

version_info="$(docker run -t "${image}" /rootfs/usr/local/bin/docker version \
  | sed -n 's/^ /    /p')"
short_commit_hash="$(echo "${version_info}" | grep -o '[0-9a-f]\{7,\}')"
commit_link="docker/docker@${short_commit_hash}"

if ! github-release info --tag "${short_commit_hash}"; then
  git tag -a "${short_commit_hash}" -m "${commit_link}" && git push --tags

  iso_file_name=boot2docker.iso
  iso_hash_cmd=(sha256sum "${iso_file_name}")
  iso_hash_output="$(docker run "${image}" "${iso_hash_cmd[@]}")"

  github-release release \
    --tag "${short_commit_hash}" \
    --name "Boot2DockerExperimental@${short_commit_hash}" \
    --description "${version_info}

${commit_link}

    $ ${iso_hash_cmd[*]}
    ${iso_hash_output}"

  docker run --rm "${image}" > "${iso_file_name}"

  github-release upload \
    --tag "${short_commit_hash}" \
    --name "${iso_file_name}" \
    --file "${iso_file_name}"

  rm "${iso_file_name}"
fi
